<ul class="small text-muted list-unstyled list-inline topic-tags js-favourite-insert-after-form js-favourite-tags-topic-{$oTopic->getId()}" itemprop="keywords">
  <li><span class="glyphicon glyphicon-tags"></span></li>

  {strip}
    {if $oTopic->getTagsArray()}
      {foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
        <li>{if !$smarty.foreach.tags_list.first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
      {/foreach}
    {else}
      <li>{$aLang.topic_tags_empty}</li>
    {/if}

    {if $oUserCurrent}
      {if $oFavourite}
        {foreach from=$oFavourite->getTagsArray() item=sTag name=tags_list_user}
          <li class="topic-tags-user js-favourite-tag-user">, <a rel="tag" href="{$oUserCurrent->getUserWebPath()}favourites/topics/tag/{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
        {/foreach}
      {/if}

      <li class="topic-tags-edit js-favourite-tag-edit" {if !$oFavourite}style="display:none;"{/if}>
        <a href="#" onclick="return ls.favourite.showEditTags({$oTopic->getId()},'topic',this);" class="link-dotted">{$aLang.favourite_form_tags_button_show}</a>
      </li>
    {/if}
  {/strip}
</ul>
