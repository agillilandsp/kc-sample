<#macro mainLayout active bodyClass>
    <!doctype html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow">

        <title>${msg("accountManagementTitle")}</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
        <#if properties.stylesCommon?has_content>
            <#list properties.stylesCommon?split(' ') as style>
                <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
            </#list>
        </#if>
    </head>
    <body class="admin-console user ${bodyClass}">

    <header class="mdc-top-app-bar mdc-top-app-bar--dense">
        <div class="mdc-top-app-bar__row">
            <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                <div id="logo-container"></div>
            </section>
            <div class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
                <div class="container">
                    <#if referrer?has_content && referrer.url?has_content>
                    <button class="mdc-button" type="button" id="referrer" onclick="window.location='${referrer.url}'">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label">${msg("backTo",referrer.name)}</span>
                    </button>
                    </#if>
                    <button class="mdc-button" type="button" onclick="window.location='${url.logoutUrl}'">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label">${msg("doSignOut")}</span>
                    </button>
                </div>
            </div>
        </div>
    </header>

    <div class="mdc-top-app-bar--dense-fixed-adjust">
        <div class="kc-dark-grid-layout">
            <div id="side-list" class="mdc-layout-grid__cell mdc-layout-grid__cell--span-2">
                <div id="list-header">Manage</div>
                <ul class="mdc-list mdc-list--icon-list">
                    <li class="mdc-list-item <#if active=='account'>active</#if>"
                        onclick="window.location='${url.accountUrl}'">
                        <span class="mdc-list-item__ripple"></span>
                        <span class="mdc-list-item__graphic material-icons">account_circle</span>
                        <span class="mdc-list-item__text">${msg("account")}</span>
                    </li>
                    <#if features.passwordUpdateSupported>
                        <li class="mdc-list-item <#if active=='password'>active</#if>"
                            onclick="window.location='${url.passwordUrl}'">
                            <span class="mdc-list-item__ripple"></span>
                            <span class="mdc-list-item__graphic material-icons">password</span>
                            <span class="mdc-list-item__text">${msg("password")}</span>
                        </li>
                    </#if>
                    <li class="mdc-list-item <#if active=='sessions'>active</#if>"
                        onclick="window.location='${url.sessionsUrl}'">
                        <span class="mdc-list-item__ripple"></span>
                        <span class="mdc-list-item__graphic material-icons">schedule</span>
                        <span class="mdc-list-item__text">${msg("sessions")}</span>
                    </li>
                    <li class="mdc-list-item <#if active=='applications'>active</#if>"
                        onclick="window.location='${url.applicationsUrl}'">
                        <span class="mdc-list-item__ripple"></span>
                        <span class="mdc-list-item__graphic material-icons">apps</span>
                        <span class="mdc-list-item__text">${msg("applications")}</span>
                    </li>
                </ul>
            </div>

            <div id="main-content" class="mdc-layout-grid__cell mdc-layout-grid__cell--span-10">
                <#if message?has_content>
                    <div class="alert alert-${message.type}">
                        <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>
                        <#if message.type=='error' ><span class="pficon pficon-error-circle-o"></span></#if>
                        <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>

                <#nested "content">
            </div>
        </div>
    </div>

    </body>
    </html>
</#macro>