<#import "parts/commom.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

Registration
${message!""}
    <@l.login "/registration" true/>

</@c.page>