<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>

    <div class="row">
        <div class="col-md-10">
            <h2>${msg("sessionsHtmlTitle")}</h2>
        </div>
    </div>

    <div class="mdc-data-table">
        <div class="mdc-data-table__table-container">
            <table class="mdc-data-table__table">
                <thead>
                <tr class="mdc-data-table__header-row">
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">
                        ${msg("ip")}
                    </th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">
                        ${msg("started")}
                    </th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">
                        ${msg("lastAccess")}
                    </th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">
                        ${msg("expires")}
                    </th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">
                        ${msg("clients")}
                    </th>
                </tr>
                </thead>

                <tbody class="mdc-data-table__content">
                <#list sessions.sessions as session>
                    <tr class="mdc-data-table__row">
                        <td class="mdc-data-table__cell" scope="row">${session.ipAddress}</td>
                        <td class="mdc-data-table__cell" scope="row">${session.started?datetime}</td>
                        <td class="mdc-data-table__cell" scope="row">${session.lastAccess?datetime}</td>
                        <td class="mdc-data-table__cell" scope="row">${session.expires?datetime}</td>
                        <td class="mdc-data-table__cell" scope="row">
                            <#list session.clients as client>
                                ${client}<br/>
                            </#list>
                        </td>
                    </tr>
                </#list>
                </tbody>

            </table>

        </div>
    </div>

    <div id="kc-form-buttons" class="button-container">
        <form class="right-aligned-button" action="${url.sessionsUrl}" method="post">
            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
            <button id="logout-all-sessions" class="mdc-button mdc-button--outlined">
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">${msg("doLogOutAllSessions")}</span>
            </button>
        </form>
    </div>

</@layout.mainLayout>
