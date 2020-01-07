<#macro login path isReg>
    <form method="post" action=${path}>
        <div><label><input type="text" name="username" placeholder="username"></label></div>
        <div><label><input type="password" name="password" placeholder="password"></label></div>
        <#if !isReg><a href="/resetPassword">Forgot password?</a> </#if>
        <#if isReg>
            <div><label><input type="email" name="email" placeholder="email"></label></div></#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>
            <button type="submit"><#if !isReg>Sign in<#else>Create</#if></div>
    </form>
    <#if !isReg><a href="/registration">Add new user</a> </#if>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Sign Out"/>
    </form>
</#macro>