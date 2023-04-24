<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <div class="row">
        <div class="col-md-10">
            <h2 class="title">${msg("editAccountHtmlTitle")}</h2>
        </div>
    </div>

    <form action="${url.accountUrl}" class="form-horizontal bodyContent" method="post">

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if !realm.registrationEmailAsUsername>
        <div class="subtitle message">
            <span class="subtitle">${msg("allFieldsRequired")}</span>
        </div>
        <div class="form-container">
          <div class="form-group">
              <label class="mdc-text-field mdc-text-field--filled">
                  <span class="mdc-text-field__ripple"></span>
                  <span class="mdc-floating-label">
                      ${msg("username")}
                      <#if realm.editUsernameAllowed><span class="required">*</span></#if>
                  </span>
                  <input class="mdc-text-field__input" id="username" name="username" type="text"
                         <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
              </label>
            </div>
          </#if>

          <div class="form-group ${messagesPerField.printIfExists('email','has-error')}">
              <label class="mdc-text-field mdc-text-field--filled">
                  <span class="mdc-text-field__ripple"></span>
                  <span class="mdc-floating-label">
                      ${msg("email")}
                  </span>
                  <input class="mdc-text-field__input" id="email" name="email" type="text"
                         value="${(account.email!'')}"/>
              </label>
          </div>

          <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
              <label class="mdc-text-field mdc-text-field--filled">
                  <span class="mdc-text-field__ripple"></span>
                  <span class="mdc-floating-label">
                      ${msg("firstName")}
                  </span>
                  <input class="mdc-text-field__input" id="firstName" name="firstName" type="text"
                         value="${(account.firstName!'')}"/>
              </label>
          </div>

          <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">
              <label class="mdc-text-field mdc-text-field--filled">
                  <span class="mdc-text-field__ripple"></span>
                  <span class="mdc-floating-label">
                      ${msg("lastName")}
                  </span>
                  <input class="mdc-text-field__input" id="lastName" name="lastName" type="text"
                         value="${(account.lastName!'')}"/>
              </label>
          </div>
        </div>

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="button-container">
                    <#if url.referrerURI??><a
                        href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                    <button type="submit"
                        class="left-aligned-button mdc-button  ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}"
                        name="submitAction" value="Cancel">${msg("doCancel")}</button>
                    <button type="submit"
                            class="right-aligned-button mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                            name="submitAction" value="Save">${msg("doSave")}</button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>
