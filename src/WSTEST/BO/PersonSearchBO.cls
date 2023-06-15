Class WSTEST.BO.PersonSearchBO Extends EnsLib.REST.Operation
{

Parameter INVOCATION = "Queue";

Method getPerson(pRequest As WSTEST.Object.PersonSearchRequest, Output pResponse As WSTEST.Object.PersonSearchResponse) As %Status
{
	try {
    set pResponse = ##class(WSTEST.Object.PersonSearchResponse).%New()

    set sql = "SELECT %Id as Identifier FROM WSTEST_Object.Person WHERE PersonId = ?"
    set statement = ##class(%SQL.Statement).%New(), statement.%ObjectSelectMode = 1
    set status = statement.%Prepare(sql)
    if ($$$ISOK(status)) {
        set resultSet = statement.%Execute(pRequest.pid)
        if (resultSet.%SQLCODE = 0) {
            while (resultSet.%Next() '= 0) {
                $$$TRACE("PersonId is "_resultSet.%GetData(1))
                #Dim person As WSTEST.Object.Person
                set person = ##class(WSTEST.Object.Person).%OpenId(resultSet.%GetData(1))
                set pResponse.PersonId = person.PersonId
                set pResponse.Name = person.Name
                set pResponse.LastName = person.LastName
                set pResponse.Sex = person.Sex
                set pResponse.Dob = person.Dob
              }
        }
    }
    else { 
      set tSC = "Error retrieving the person with PersonId = "_pRequest.pid
    }
    set tSC = $$$OK
   
   }catch{
    Set tSC=$$$SystemError
   }
   Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="WSTEST.Object.PersonSearchRequest">
    <Method>getPerson</Method>
  </MapItem>
</MapItems>
}

}
