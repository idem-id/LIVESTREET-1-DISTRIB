<ul class="list-unstyled item-list">
  {foreach from=$aBlogs item=oBlog}
    <li class="media">
      <a href="{$oBlog->getUrlFull()}" class="pull-left"><img src="{$oBlog->getAvatarPath(48)}" width="48" height="48" alt="{$oBlog->getTitle()|escape:'html'}" class="media-object avatar" /></a>
      <div class="media-body">
        <a href="{$oBlog->getUrlFull()}" class="blog-top" >{$oBlog->getTitle()|escape:'html'}</a>
        {if {cfg name='custom.blog.vote'}}
          <p class="small text-muted">{$aLang.blog_rating}: <strong>{$oBlog->getRating()}</strong></p>
        {/if}
      </div>
    </li>
  {/foreach}
</ul>
