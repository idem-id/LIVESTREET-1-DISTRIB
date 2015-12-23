<table class="table table-blogs">
  {if $bBlogsUseOrder}
    <thead>
      <tr>
        <th class="cell-name small"><a href="{$sBlogsRootPage}?order=blog_title&amp;order_way={if $sBlogOrder=='blog_title'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_title'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_title}</span></a></th>

        {if $oUserCurrent}
          <th class="hidden-xs small cell-join">{$aLang.blog_join_leave}</th>
        {/if}

        <th class="hidden-xs small cell-readers">
          <a href="{$sBlogsRootPage}?order=blog_count_user&amp;order_way={if $sBlogOrder=='blog_count_user'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_count_user'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_readers}</span></a>
        </th>

        {if {cfg name='custom.blog.vote'}}
          <th class="hidden-xs small cell-rating align-center">
            <a href="{$sBlogsRootPage}?order=blog_rating&amp;order_way={if $sBlogOrder=='blog_rating'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_rating'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_rating}</span></a>
          </th>
        {/if}
      </tr>
    </thead>
  {else}
    <thead>
      <tr>
        <th class="small cell-name">{$aLang.blogs_title}</th>

        {if $oUserCurrent}
          <th class="hidden-xs small cell-join">{$aLang.blog_join_leave}</th>
        {/if}

        <th class="hidden-xs small cell-readers">{$aLang.blogs_readers}</th>

        {if {cfg name='custom.blog.vote'}}
          <th class="hidden-xs small cell-rating align-center">{$aLang.blogs_rating}</th>
        {/if}
      </tr>
    </thead>
  {/if}

  <tbody>
    {if $aBlogs}
      {foreach from=$aBlogs item=oBlog}
        {assign var="oUserOwner" value=$oBlog->getOwner()}

        <tr>
          <td class="cell-name">
            <a href="{$oBlog->getUrlFull()}">
              <img src="{$oBlog->getAvatarPath(48)}" width="48" height="48" class="avatar visible-lg" alt="blog" />
            </a>

            <h4>
              <a href="{$oBlog->getUrlFull()}" class="blog-name">{$oBlog->getTitle()|escape:'html'}</a>

              {if $oBlog->getType() == 'close'}
                <span title="{$aLang.blog_closed}" class="glyphicon glyphicon-lock text-muted"></span>
              {/if}
            </h4>

            <p class="blog-description">{$oBlog->getDescription()|strip_tags|trim|truncate:150:'...'|escape:'html'}</p>
          </td>

          {if $oUserCurrent}
            <td class="hidden-xs small cell-join">
              {if $oUserCurrent->getId() != $oBlog->getOwnerId() and $oBlog->getType() == 'open'}
                <a href="#" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;" class="link-dotted">
                  {if $oBlog->getUserIsJoin()}
                    {$aLang.blog_leave}
                  {else}
                    {$aLang.blog_join}
                  {/if}
                </a>
              {else}
                &mdash;
              {/if}
            </td>
          {/if}

          <td class="hidden-xs small cell-readers" id="blog_user_count_{$oBlog->getId()}">{$oBlog->getCountUser()}</td>

          {if {cfg name='custom.blog.vote'}}
            <td class="hidden-xs small text-success cell-rating">{$oBlog->getRating()}</td>
          {/if}
        </tr>
      {/foreach}
    {else}
      <tr>
        <td colspan="3">
          {if $sBlogsEmptyList}
            {$sBlogsEmptyList}
          {else}

          {/if}
        </td>
      </tr>
    {/if}
  </tbody>
</table>
