<#import "parts/commom.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    ${message!""}
    Login page
    <@l.login "/login"false/>
</@c.page>