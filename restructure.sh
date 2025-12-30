#!/usr/bin/env bash
set -euo pipefail

# ==========================
# Fusisoft Spring MVC WAR Fixer
# - backups project
# - rebuilds src/main/webapp structure
# - writes web.xml + mt-servlet.xml
# - moves JSPs into /WEB-INF/jsps
# - normalizes common bad links (/services/*, jsps/*)
# ==========================

ROOT="$(pwd)"
TS="$(date +%Y%m%d-%H%M%S)"
BACKUP="../$(basename "$ROOT")-backup-$TS.tgz"

echo "==> [1/8] Backup project to: $BACKUP"
tar -czf "$BACKUP" .

echo "==> [2/8] Ensure base folders exist"
mkdir -p src/main/java
mkdir -p src/main/resources
mkdir -p src/test/java
mkdir -p src/main/webapp

echo "==> [3/8] Rebuild webapp structure (secure JSPs)"
mkdir -p src/main/webapp/WEB-INF/jsps
mkdir -p src/main/webapp/styles
mkdir -p src/main/webapp/images
mkdir -p src/main/webapp/js

# Move legacy JSP folders into secure location
if [ -d "src/main/webapp/jsps" ]; then
  echo "   - Moving legacy JSPs: src/main/webapp/jsps -> src/main/webapp/WEB-INF/jsps"
  shopt -s dotglob nullglob
  mv src/main/webapp/jsps/* src/main/webapp/WEB-INF/jsps/ || true
  shopt -u dotglob nullglob
  rmdir src/main/webapp/jsps 2>/dev/null || true
fi

# Move JSPs found in other common locations (conservative)
if [ -d "src/main/webapp/jsp" ]; then
  echo "   - Moving legacy JSPs: src/main/webapp/jsp -> src/main/webapp/WEB-INF/jsps"
  shopt -s dotglob nullglob
  mv src/main/webapp/jsp/* src/main/webapp/WEB-INF/jsps/ || true
  shopt -u dotglob nullglob
  rmdir src/main/webapp/jsp 2>/dev/null || true
fi

echo "==> [4/8] Write web.xml (Spring mapped to /)"
mkdir -p src/main/webapp/WEB-INF

cat > src/main/webapp/WEB-INF/web.xml <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                             http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1"
         metadata-complete="false">

    <display-name>Fusisoft Web Application</display-name>

    <!-- Force UTF-8 encoding -->
    <filter>
        <filter-name>characterEncodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
        <init-param>
            <param-name>forceEncoding</param-name>
            <param-value>true</param-value>
        </init-param>
    </filter>

    <filter-mapping>
        <filter-name>characterEncodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <!-- Spring Dispatcher Servlet -->
    <servlet>
        <servlet-name>spring</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>/WEB-INF/mt-servlet.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <!-- Map Spring to root so /myapps/ works -->
    <servlet-mapping>
        <servlet-name>spring</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

    <session-config>
        <session-timeout>30</session-timeout>
        <cookie-config>
            <http-only>true</http-only>
        </cookie-config>
    </session-config>

    <!-- Error routes go through controllers -->
    <error-page>
        <error-code>404</error-code>
        <location>/error</location>
    </error-page>

    <error-page>
        <error-code>500</error-code>
        <location>/error</location>
    </error-page>

    <error-page>
        <exception-type>java.lang.Throwable</exception-type>
        <location>/error</location>
    </error-page>

    <welcome-file-list>
        <welcome-file>/</welcome-file>
    </welcome-file-list>
</web-app>
EOF

echo "==> [5/8] Write mt-servlet.xml (valid + secure view resolver)"
cat > src/main/webapp/WEB-INF/mt-servlet.xml <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
           http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
           http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
           http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd">

    <context:component-scan base-package="com.mt"/>

    <mvc:annotation-driven/>

    <mvc:resources mapping="/styles/**" location="/styles/"/>
    <mvc:resources mapping="/images/**" location="/images/"/>
    <mvc:resources mapping="/js/**" location="/js/"/>

    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/jsps/"/>
        <property name="suffix" value=".jsp"/>
    </bean>

</beans>
EOF

echo "==> [6/8] Normalize package inconsistencies (optional, safe mode)"
# If you have both com.mt.controller and com.mt.controllers, this does NOT auto-merge (too risky).
# But if only com.mt.controller exists, it will convert it to com.mt.controllers.
CANON="com.mt.controllers"
ALT="com.mt.controller"

HAS_CANON="$(find src/main/java -type f -name "*.java" -print0 2>/dev/null | xargs -0 grep -l "package $CANON" 2>/dev/null || true)"
HAS_ALT="$(find src/main/java -type f -name "*.java" -print0 2>/dev/null | xargs -0 grep -l "package $ALT" 2>/dev/null || true)"

if [ -n "$HAS_ALT" ] && [ -z "$HAS_CANON" ]; then
  echo "   - Converting $ALT -> $CANON"
  if [ -d "src/main/java/com/mt/controller" ]; then
    mkdir -p src/main/java/com/mt/controllers
    mv src/main/java/com/mt/controller/* src/main/java/com/mt/controllers/ || true
    rmdir src/main/java/com/mt/controller 2>/dev/null || true
  fi

  find src/main/java -type f -name "*.java" -print0 | xargs -0 sed -i.bak \
    -e "s/package $ALT;/package $CANON;/g" \
    -e "s/import $ALT\./import $CANON\./g"
  find src/main/java -type f -name "*.bak" -delete
else
  echo "   - Package conversion skipped (either already canonical OR both packages exist)."
fi

echo "==> [7/8] Fix JSP links (conservative bulk replace)"
# - remove /services prefix from URLs (since we map Spring to "/")
# - update direct jsps/ links (JSPs are now under WEB-INF so those links must be controller routes)
# NOTE: This is text replacement only; for best practice convert to <c:url>.
if [ -d "src/main/webapp/WEB-INF/jsps" ]; then
  find src/main/webapp/WEB-INF/jsps -type f -name "*.jsp" -print0 | xargs -0 sed -i.bak \
    -e 's#href="services/#href="#g' \
    -e 's#action="services/#action="#g' \
    -e 's#href="jsps/#href="#g' \
    -e 's#action="jsps/#action="#g'
  find src/main/webapp/WEB-INF/jsps -type f -name "*.bak" -delete
fi

echo "==> [8/8] Sanity checks"
echo "   - web.xml lines: $(wc -l < src/main/webapp/WEB-INF/web.xml)"
echo "   - mt-servlet.xml lines: $(wc -l < src/main/webapp/WEB-INF/mt-servlet.xml)"
echo "   - JSP count: $(find src/main/webapp/WEB-INF/jsps -type f -name '*.jsp' | wc -l | tr -d ' ')"

echo ""
echo "✅ DONE."
echo "Backup: $BACKUP"
echo ""
echo "Next steps:"
echo "1) Ensure HomeController has @GetMapping(\"/\") returning \"home\""
echo "2) Ensure ErrorController has @GetMapping(\"/error\") returning \"error\""
echo "3) Rebuild: mvn clean package"

