Class WSTEST.Endpoint Extends %CSP.REST
{

Parameter HandleCorsRequest = 0;

XData UrlMap [ XMLNamespace = "https://www.intersystems.com/urlmap" ]
{
<Routes>
	<Route Url="/testGet/:pid" Method="GET" Call="TestGet" />
	<Route Url="/testPost" Method="POST" Call="TestPost" />
</Routes>
}

ClassMethod OnHandleCorsRequest(url As %String) As %Status
{
	set url = %request.GetCgiEnv("HTTP_REFERER")
    set origin = $p(url,"/",1,3) // origin = "http(s)://origin.com:port"

    // here you can check specific origins
    // otherway, it will allow all origins (useful while developing only)

	do %response.SetHeader("Access-Control-Allow-Credentials","true")
	do %response.SetHeader("Access-Control-Allow-Methods","GET,POST,PUT,DELETE,OPTIONS")
	do %response.SetHeader("Access-Control-Allow-Origin",origin)
	do %response.SetHeader("Access-Control-Allow-Headers","Access-Control-Allow-Origin, Origin, X-Requested-With, Content-Type, Accept, Authorization, Cache-Control")
	quit $$$OK
}

ClassMethod TestGet(pid As %Integer) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        
        
        set status = ##class(Ens.Director).CreateBusinessService("WSTEST.BS.PersonSearchBS", .instance)

        set status = instance.OnProcessInput(pid, .response)
       	if $ISOBJECT(response) {
        	Do ##class(%REST.Impl).%WriteResponse(response.%JSONExport())
		}
        
    } Catch (ex) {
        Do ##class(%REST.Impl).%SetStatusCode("400")
        Do ##class(%REST.Impl).%WriteResponse(ex.DisplayString())
        return {"errormessage": "Client error"}
    }
    Quit $$$OK
}

ClassMethod TestPost() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        
        set bodyJson = %request.Content.Read()
        
        
        set status = ##class(Ens.Director).CreateBusinessService("WSTEST.BS.PersonSaveBS", .instance)
       	#dim response as %DynamicObject
        set status = instance.OnProcessInput(bodyJson, .response)
        
        if $ISOBJECT(response) {
            Do ##class(%REST.Impl).%WriteResponse(response.%JSONExport())
	    }
        
    } Catch (ex) {
        Do ##class(%REST.Impl).%SetStatusCode("400")
        Do ##class(%REST.Impl).%WriteResponse(ex.DisplayString())
        return {"errormessage": "Client error"}
    }
    Quit $$$OK
}

}
