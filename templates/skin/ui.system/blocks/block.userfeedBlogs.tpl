{if $oUserCurrent}
  <section class="panel panel-default block block-type-activity">
    <div class="panel-body">

      <header class="block-header">
        <h3>{$aLang.userfeed_block_blogs_title}</h3>
      </header>

      <div class="block-content">
        <p class="small text-muted">{$aLang.userfeed_settings_note_follow_blogs}</p>

        {if count($aUserfeedBlogs)}
          <ul class="list-unstyled stream-settings-blogs">
            {foreach from=$aUserfeedBlogs item=oBlog}
              {assign var=iBlogId value=$oBlog->getId()}
              <li class="checkbox">
                <label>
                  <input class="userfeedBlogCheckbox"
                      type="checkbox"
                      {if isset($aUserfeedSubscribedBlogs.$iBlogId)} checked="checked"{/if}
                      onClick="if (jQuery(this).prop('checked')) { ls.userfeed.subscribe('blogs',{$iBlogId}) } else { ls.userfeed.unsubscribe('blogs',{$iBlogId}) } " />
                  <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>
                </label>
              </li>
            {/foreach}
          </ul>
        {else}
          <p class="small text-muted">{$aLang.userfeed_no_blogs}</p>
        {/if}
      </div>

    </div>
  </section>
{/if}
