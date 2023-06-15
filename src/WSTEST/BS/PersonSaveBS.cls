Class WSTEST.BS.PersonSaveBS Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	Try {
        #Dim personSaveRequest As WSTEST.Object.PersonSaveRequest
        set personSaveRequest = ##class("WSTEST.Object.PersonSaveRequest").%New()
        set personSaveRequest.JSON = pInput
        Set tSC = ..SendRequestSync("WSTEST.BO.PersonSaveBO", personSaveRequest, .pResponse)
        if $ISOBJECT(pResponse) {
            set pOutput = pResponse
        }        
        } 
    Catch (ex) {
	    	set error = ex.DisplayString()            
            // set pOutput.errormessage = error
        }
	Quit $$$OK
}

}
