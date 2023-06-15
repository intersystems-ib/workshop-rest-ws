Class WSTEST.BO.PersonSaveBO Extends EnsLib.REST.Operation
{

Parameter INVOCATION = "Queue";

Method savePerson(pRequest As WSTEST.Object.PersonSaveRequest, Output pResponse As WSTEST.Object.PersonSaveResponse) As %Status
{
	try {
      set person = ##class("WSTEST.Object.Person").%New()
      #dim request as %DynamicObject = {}.%FromJSON(pRequest.JSON)
      set person.PersonId = request.PersonId
      set person.Name = request.Name
      set person.LastName = request.LastName
      set person.Sex = request.Sex
      set person.Dob = request.Dob

      set tSC = person.%Save()
      set pResponse = ##class("WSTEST.Object.PersonSaveResponse").%New()
      set pResponse.PersonId = person.PersonId
      set pResponse.Name = person.Name
      set pResponse.LastName = person.LastName
      set pResponse.Sex = person.Sex
      set pResponse.Dob = person.Dob
      
   }catch{
       Set tSC="Error saving the person"
   }
   Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="WSTEST.Object.PersonSaveRequest">
    <Method>savePerson</Method>
  </MapItem>
</MapItems>
}

}
