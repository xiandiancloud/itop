function jumpPage(pageNo){
	$("#pageNo").val(pageNo);
	$("#mainForm").submit();
}

function changePageSize()
{
	var pageSize = $("#curPageSize").val();
	$("#pageNo").val(1);
	$("#pageSize").val(pageSize);
	$("#mainForm").submit();
}

function sort(orderBy,defaultOrder){
	if($("#orderBy").val()==orderBy){
		if($("#order").val()==""){
			$("#order").val(defaultOrder);}
			else if($("#order").val()=="desc"){
			$("#order").val("asc");}
			else if($("#order").val()=="asc"){
			$("#order").val("desc");}
		}
		else{
			$("#orderBy").val(orderBy);
			$("#order").val(defaultOrder);
		}

		$("#mainForm").submit();
}

