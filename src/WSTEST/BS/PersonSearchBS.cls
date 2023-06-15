Class WSTEST.BS.PersonSearchBS Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	Try {
        #Dim personSearchRequest As WSTEST.Object.PersonSearchRequest
        set personSearchRequest = ##class("WSTEST.Object.PersonSearchRequest").%New()
        set personSearchRequest.pid = pInput
        Set tSC = ..SendRequestSync("WSTEST.BO.PersonSearchBO", personSearchRequest, .pResponse)
        if $ISOBJECT(pResponse) {                    
            set pOutput = pResponse
        }
        else {
            $$$TRACE("Person doesn't found")
            set pOutput.Name = "Anonimous"
        }            
        } 
    Catch (ex) {
	    	set error = ex.DisplayString()            
            // set pOutput.errormessage = error
        }
	Quit $$$OK
}

}
