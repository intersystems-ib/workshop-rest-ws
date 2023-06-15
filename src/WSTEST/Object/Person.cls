Class WSTEST.Object.Person Extends %Persistent
{

/// ID of the person
Property PersonId As %Integer;

/// Name of the person
Property Name As %String;

/// Lastname of the person
Property LastName As %String;

/// Sex of the person
Property Sex As %String;

/// DOB of the person
Property Dob As %String;

Index PersonIDX On PersonId [ PrimaryKey ];

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PersonId</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>LastName</Value>
</Value>
<Value name="5">
<Value>Sex</Value>
</Value>
<Value name="6">
<Value>Dob</Value>
</Value>
</Data>
<DataLocation>^WSTEST.Object.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^WSTEST.Object.PersonD</IdLocation>
<IndexLocation>^WSTEST.Object.PersonI</IndexLocation>
<StreamLocation>^WSTEST.Object.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
