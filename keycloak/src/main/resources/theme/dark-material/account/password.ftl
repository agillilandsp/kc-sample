<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

    <div class="row">
        <div class="col-md-10">
            <h2 class="title">${msg("changePasswordHtmlTitle")}</h2>
        </div>
    </div>

    <form action="${url.passwordUrl}" class="form-horizontal bodyContent" method="post">
        <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

        <#if password.passwordSet>
        <div class="message">
            <div id="required-text">${msg("allFieldsRequired")}</div>
            <div>A new password must contain:</div>
            <div>15-27 characters</div>
            <div>2 uppercase letters</div>
            <div>2 lowercase letters</div>
            <div>2 numbers</div>
            <div>2 special characters</div>
        </div>
        <div class="form-container">
          <div class="form-group">
                  <label class="mdc-text-field mdc-text-field--filled">
                      <span class="mdc-text-field__ripple"></span>
                      <span class="mdc-floating-label">
                          ${msg("password")}
                      </span>
                      <input class="mdc-text-field__input" id="password" name="password" type="password" autofocus autocomplete="current-password"/>
                  </label>
              </div>
          </#if>

          <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

          <div class="form-group">
              <label class="mdc-text-field mdc-text-field--filled">
                  <span class="mdc-text-field__ripple"></span>
                  <span class="mdc-floating-label">
                      ${msg("passwordNew")}
                  </span>
                  <input class="mdc-text-field__input" id="password-new" name="password-new" type="password" autofocus autocomplete="new-password"/>
              </label>
          </div>

          <div class="form-group">
              <label class="mdc-text-field mdc-text-field--filled">
                  <span class="mdc-text-field__ripple"></span>
                  <span class="mdc-floating-label">
                      ${msg("passwordConfirm")}
                  </span>
                  <input class="mdc-text-field__input" id="password-confirm" name="password-confirm" type="password" autofocus autocomplete="new-password"/>
              </label>
          </div>
        </div>

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="button-container">
                    <button type="submit" class="right-aligned-button mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">${msg("doSave")}</button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>
