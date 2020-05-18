function bOk_Click()
{
    WbmOlimpias.AutentificareWS.Autentificare($get('tbUtilizator').value, $get('tbParola').value, SucceededCallback, FailedCallback);
}

function bCancel_Click()
{
    close();
}

function SucceededCallback(result, userContext, methodName)
{ 
    switch(methodName)
    {
        case ("Autentificare"):
        {
            if(result=='')
                window.location = 'Meniu.aspx';
            else
                window.alert(result);
            break;
        }
        default:
        {
            window.alert('Serviciu inexistent!');
        }
    }            
}
function FailedCallback(error, userContext, methodName) 
{
    if(error !== null) 
    {
        window.alert(error.get_message());
    }
}
function onKeyDown (eventElement) 
{
    eventElement = eventElement || window.event;
    var sepropaga = true;
    switch (eventElement.keyCode) 
    {
        case 13:    // enter
            if(eventElement.target.id=='tbUtilizator')
            {
                $get("tbParola").focus();
                sepropaga = false;
            }
            if(eventElement.target.id=='tbParola')
            {
                $get("bOk").focus();
                sepropaga = false;
            }
            break;
    }
    if(eventElement.ctrlKey)
        sepropaga = false;
    if(eventElement.altKey)
        sepropaga = false;
    if(sepropaga)
    {
        return true;
    }
    else
    {
        eventElement.cancelBubble = true;
        eventElement.returnValue = false;
        eventElement.keyCode = 0;
        if (eventElement.stopPropagation) 
        {
		    eventElement.stopPropagation();
			eventElement.preventDefault();
		}
        return false;
    }
}
function pageLoad() 
{
    $addHandler(document,"keydown",onKeyDown);
    $get('tbUtilizator').focus();
} 
