{form:${1:myForm}}
    ${0}
{/form:${1:myForm}}
<div id="main" class="ribbon">
    {iteration:positionMain}
        <div class="ribbonContainer">{$positionMain.blockContent}</div>
        {$_REQUEST}
    {/iteration:positionMain}
</div>