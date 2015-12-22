            {hook run='content_end'}
          </div> <!-- /content -->

          {if !$noSidebar && $sidebarPosition != 'left'
          && $sAction != 'search'
          && $sAction != 'comments'}
            {include file='sidebar.tpl'}
          {/if}

        </div> <!-- /row -->
      </div> <!-- /container -->
    </section> <!-- /wrapper -->


    <footer id="footer" class="{if {cfg name='navbar.view'} == 'default'}footer-light{else}footer-dark{/if}">
      {include file='blocks.tpl' group='footer-top'}

      <div class="footer-center">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-lg-6 project-info">
              <h5>
                {if {cfg name='view.config_sitename'} == true}
                  {cfg name='view.name'}
                {else}
                  {cfg name='view.own_sitename'}
                {/if}
              </h5>
              {$aLang.footer_menu_project_info}
            </div>

            <div class="col-sm-4 col-lg-2">
              {if $oUserCurrent}
                <ul class="list-unstyled footer-list">
                  <li class="footer-list-header word-wrap">{$oUserCurrent->getLogin()}</li>
                  <li><a href="{$oUserCurrent->getUserWebPath()}">{$aLang.footer_menu_user_profile}</a></li>
                  <li><a href="{router page='settings'}profile/">{$aLang.user_settings}</a></li>
                  <li><a href="{router page='topic'}add/" class="js-write-window-show">{$aLang.block_create}</a></li>
                  {hook run='footer_menu_user_item' oUser=$oUserCurrent}
                  <li><a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.exit}</a></li>
                </ul>
              {else}
                <ul class="list-unstyled footer-list">
                  <li class="footer-list-header word-wrap">{$aLang.footer_menu_user_quest_title}</li>
                  {if {cfg name='custom.form.registration'}}
                    <li><a class="js-registration-form-show" href="{router page='registration'}">{$aLang.registration_submit}</a></li>
                  {/if}
                  {if {cfg name='custom.form.login'}}
                    <li><a class="js-login-form-show sign-in" href="{router page='login'}">{$aLang.user_login_submit}</a></li>
                  {/if}
                  {hook run='footer_menu_user_item' isGuest=true}
                </ul>
              {/if}
            </div>

            <div class="col-sm-4 col-lg-2">
              <ul class="list-unstyled footer-list">
                <li class="footer-list-header">{$aLang.footer_menu_navigate_title}</li>
                <li><a href="{cfg name='path.root.web'}">{$aLang.topic_title}</a></li>
                <li><a href="{router page='blogs'}">{$aLang.blogs}</a></li>
                <li><a href="{router page='people'}">{$aLang.people}</a></li>
                <li><a href="{router page='stream'}">{$aLang.stream_menu}</a></li>
                {hook run='footer_menu_navigate_item'}
              </ul>
            </div>

            <div class="col-sm-4 col-lg-2">
              <ul class="list-unstyled footer-list">
                <li class="footer-list-header">{$aLang.footer_menu_navigate_info}</li>
                <li><a href="#">{$aLang.footer_menu_project_about}</a></li>
                <li><a href="#">{$aLang.footer_menu_project_rules}</a></li>
                <li><a href="#">{$aLang.footer_menu_project_advert}</a></li>
                <li><a href="#">{$aLang.footer_menu_project_help}</a></li>
                {hook run='footer_menu_project_item'}
              </ul>
            </div>
          </div>

          {hook run='footer_end'}
        </div>
      </div>

      <div class="footer-bottom">
        <div class="container">
          <div class="row">
            <div class="col-sm-10">
              {hook run='copyright'}.
              {cfg name='custom.cr'}.
            </div>

            <div class="col-sm-2 text-right social-icons">
              <a title="{$aLang.vk}" href="{cfg name='custom.vk.url'}" rel="nofollow"><i class="fa fa-vk fa-fw"></i></a>
              <a title="{$aLang.facebook}" href="{cfg name='custom.facebook.url'}" rel="nofollow"><i class="fa fa-facebook fa-fw"></i></a>
              <a title="{$aLang.twitter}" href="{cfg name='custom.twitter.url'}" rel="nofollow"><i class="fa fa-twitter fa-fw"></i></a>
              <a title="{$aLang.youtube}" href="{cfg name='custom.youtube.url'}" rel="nofollow"><i class="fa fa-youtube fa-fw"></i></a>
              <a title="{$aLang.vimeo}" href="{cfg name='custom.vimeo.url'}" rel="nofollow"><i class="fa fa-vimeo-square fa-fw"></i></a>
              <a title="{$aLang.github}" href="{cfg name='custom.github.url'}" rel="nofollow"><i class="fa fa-github-alt fa-fw"></i></a>
              <a title="{$aLang.steam}" href="{cfg name='custom.steam.url'}" rel="nofollow"><i class="fa fa-steam fa-fw"></i></a>
            </div>
          </div>
        </div>
      </div>
    </footer>


    {include file='toolbar.tpl'}

    {hook run='body_end'}
  </div> <!-- /page-wrapper -->

</body>
</html>
