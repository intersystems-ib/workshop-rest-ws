Class WSTEST.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="WSTEST.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="WSTEST.BS.PersonSaveBS" Category="" ClassName="WSTEST.BS.PersonSaveBS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="WSTEST.BS.PersonSearchBS" Category="" ClassName="WSTEST.BS.PersonSearchBS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="WSTEST.BO.PersonSaveBO" Category="" ClassName="WSTEST.BO.PersonSaveBO" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="WSTEST.BO.PersonSearchBO" Category="" ClassName="WSTEST.BO.PersonSearchBO" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
