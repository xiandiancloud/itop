/*
This software is allowed to use under GPL or you need to obtain Commercial or Enterise License
to use it in non-GPL project. Please contact sales@dhtmlx.com for details
*/
scheduler.attachEvent("onTimelineCreated",function(a){if(a.render=="tree")a.y_unit_original=a.y_unit,a.y_unit=scheduler._getArrayToDisplay(a.y_unit_original),scheduler.attachEvent("onOptionsLoadStart",function(){a.y_unit=scheduler._getArrayToDisplay(a.y_unit_original)}),scheduler.form_blocks[a.name]={render:function(b){var c="<div class='dhx_section_timeline' style='overflow: hidden; height: "+b.height+"px'></div>";return c},set_value:function(b,c,e,f){var d=scheduler._getArrayForSelect(scheduler.matrix[f.type].y_unit_original,
f.type);b.innerHTML="";var a=document.createElement("select");b.appendChild(a);for(var h=b.getElementsByTagName("select")[0],i=0;i<d.length;i++){var g=document.createElement("option");g.value=d[i].key;if(g.value==e[scheduler.matrix[f.type].y_property])g.selected=!0;g.innerHTML=d[i].label;h.appendChild(g)}},get_value:function(b){return b.firstChild.value},focus:function(){}}});
scheduler.attachEvent("onBeforeViewRender",function(a,b,c){var e={};if(a=="tree"){var f,d,j,h,i,g;b.children?(f=c.folder_dy||c.dy,c.folder_dy&&!c.section_autoheight&&(j="height:"+c.folder_dy+"px;"),d="dhx_row_folder",h="dhx_matrix_scell folder",i="<div class='dhx_scell_expand'>"+(b.open?"-":"+")+"</div>",g=c.folder_events_available?"dhx_data_table folder_events":"dhx_data_table folder"):(f=c.dy,d="dhx_row_item",h="dhx_matrix_scell item",i="",g="dhx_data_table");td_content="<div class='dhx_scell_level"+
b.level+"'>"+i+"<div class='dhx_scell_name'>"+(scheduler.templates[c.name+"_scale_label"](b.key,b.label,b)||b.label)+"</div></div>";e={height:f,style_height:j,tr_className:d,td_className:h,td_content:td_content,table_className:g}}return e});var section_id_before;
scheduler.attachEvent("onBeforeEventChanged",function(a,b,c){if(scheduler._isRender("tree")){var e=scheduler.getSection(a[scheduler.matrix[scheduler._mode].y_property]);if(e&&typeof e.children!="undefined"&&!scheduler.matrix[scheduler._mode].folder_events_available)return c||(a[scheduler.matrix[scheduler._mode].y_property]=section_id_before),!1}return!0});
scheduler.attachEvent("onBeforeDrag",function(a,b,c){if(scheduler._isRender("tree")){var e=scheduler._locate_cell_timeline(c);if(e){var f=scheduler.matrix[scheduler._mode].y_unit[e.y].key;if(typeof scheduler.matrix[scheduler._mode].y_unit[e.y].children!="undefined"&&!scheduler.matrix[scheduler._mode].folder_events_available)return!1}var d=scheduler.getEvent(a);section_id_before=f||d[scheduler.matrix[scheduler._mode].y_property]}return!0});
scheduler._getArrayToDisplay=function(a){var b=[],c=function(e,f){for(var d=f||0,a=0;a<e.length;a++){e[a].level=d;if(typeof e[a].children!="undefined"&&typeof e[a].key=="undefined")e[a].key=scheduler.uid();b.push(e[a]);e[a].open&&e[a].children&&c(e[a].children,d+1)}};c(a);return b};
scheduler._getArrayForSelect=function(a,b){var c=[],e=function(a){for(var d=0;d<a.length;d++)scheduler.matrix[b].folder_events_available?c.push(a[d]):typeof a[d].children=="undefined"&&c.push(a[d]),a[d].children&&e(a[d].children,b)};e(a);return c};
scheduler._toggleFolderDisplay=function(a,b,c){var e,f=function(a,b,c,i){for(var g=0;g<b.length;g++){if((b[g].key==a||i)&&b[g].children)if(b[g].open=typeof c!="undefined"?c:!b[g].open,e=!0,!i&&e)break;b[g].children&&f(a,b[g].children,c,i)}};f(a,scheduler.matrix[scheduler._mode].y_unit_original,b,c);scheduler.matrix[scheduler._mode].y_unit=scheduler._getArrayToDisplay(scheduler.matrix[scheduler._mode].y_unit_original);scheduler.callEvent("onOptionsLoad",[])};
scheduler.attachEvent("onCellClick",function(a,b){scheduler._isRender("tree")&&(scheduler.matrix[scheduler._mode].folder_events_available||typeof scheduler.matrix[scheduler._mode].y_unit[b].children!="undefined"&&scheduler._toggleFolderDisplay(scheduler.matrix[scheduler._mode].y_unit[b].key))});scheduler.attachEvent("onYScaleClick",function(a,b){scheduler._isRender("tree")&&typeof b.children!="undefined"&&scheduler._toggleFolderDisplay(b.key)});
scheduler.getSection=function(a){if(scheduler._isRender("tree")){var b,c=function(a,f){for(var d=0;d<f.length;d++)f[d].key==a&&(b=f[d]),f[d].children&&c(a,f[d].children)};c(a,scheduler.matrix[scheduler._mode].y_unit_original);return b||null}};
scheduler.deleteSection=function(a){if(scheduler._isRender("tree")){var b=!1,c=function(a,f){for(var d=0;d<f.length;d++){f[d].key==a&&(f.splice(d,1),b=!0);if(b)break;f[d].children&&c(a,f[d].children)}};c(a,scheduler.matrix[scheduler._mode].y_unit_original);scheduler.matrix[scheduler._mode].y_unit=scheduler._getArrayToDisplay(scheduler.matrix[scheduler._mode].y_unit_original);scheduler.callEvent("onOptionsLoad",[]);return b}};
scheduler.deleteAllSections=function(){if(scheduler._isRender("tree"))scheduler.matrix[scheduler._mode].y_unit_original=[],scheduler.matrix[scheduler._mode].y_unit=scheduler._getArrayToDisplay(scheduler.matrix[scheduler._mode].y_unit_original),scheduler.callEvent("onOptionsLoad",[])};
scheduler.addSection=function(a,b){if(scheduler._isRender("tree")){var c=!1,e=function(a,d,j){if(b)for(var h=0;h<j.length;h++){j[h].key==d&&typeof j[h].children!="undefined"&&(j[h].children.push(a),c=!0);if(c)break;j[h].children&&e(a,d,j[h].children)}else j.push(a),c=!0};e(a,b,scheduler.matrix[scheduler._mode].y_unit_original);scheduler.matrix[scheduler._mode].y_unit=scheduler._getArrayToDisplay(scheduler.matrix[scheduler._mode].y_unit_original);scheduler.callEvent("onOptionsLoad",[]);return c}};
scheduler.openAllSections=function(){scheduler._isRender("tree")&&scheduler._toggleFolderDisplay(1,!0,!0)};scheduler.closeAllSections=function(){scheduler._isRender("tree")&&scheduler._toggleFolderDisplay(1,!1,!0)};scheduler.openSection=function(a){scheduler._isRender("tree")&&scheduler._toggleFolderDisplay(a,!0)};scheduler.closeSection=function(a){scheduler._isRender("tree")&&scheduler._toggleFolderDisplay(a,!1)};
