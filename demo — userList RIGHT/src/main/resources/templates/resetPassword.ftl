<#import "parts/commom.ftl" as c>
<@c.page>

    <div>
        <form method="post" action="/resPas">
            <input type="text" name="username" placeholder="username">
            <input type="password" name="password" placeholder="new password">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit">Reset</button>
        </form>
    </div>
    <a href="/login">Login</a>
</@c.page>
