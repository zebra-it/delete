<#import "parts/commom.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div>
        <@l.logout/>
        <span><a href="/user"> User List</a></span>
    </div>
    <div>
        <form method="post" action="/main">
            <p>
                <input type="text" name="text" placeholder="text"/>
                <input type="text" name="tag" placeholder="tag"/>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit">Add</button>
            </p>
        </form>
    </div>
    <div>
        <form method="get" action="/main">
            <p>
                <input type="text" name="filter" placeholder="filter" value="${filter!""}"/>
                <button type="submit">Search</button>
            </p>
        </form>
    </div>
    <div>
        <#list posts as post>

            <div>
                <i>${post.text}</i>
                <strong>${post.tag}</strong>
                <strong>${post.authorName}</strong>
            </div>

        <#else>
            No posts
        </#list>
    </div>

</@c.page>

