<%-- 
    Document   : test
    Created on : Oct 15, 2014, 1:51:33 PM
    Author     : AbdHafeez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>Show/Hide</title>
<script type="text/javascript">
// <![CDATA[
function display(obj,id1,id2) {
txt = obj.options[obj.selectedIndex].value;
document.getElementById(id1).style.display = 'none';
document.getElementById(id2).style.display = 'none';
if ( txt.match(id1) ) {
document.getElementById(id1).style.display = 'block';
}
if ( txt.match(id2) ) {
document.getElementById(id2).style.display = 'block';
}
}
// ]]>
</script>
</head>

<body>
<table width="340" cellspacing="0" cellpadding="2">
<thead>
<tr>
<td class="title">Type:</td>
<td class="field">
<select name="type" onchange="display(this,'text','image');">
<option>Please select:</option>
<option value="image">Image</option>
<option value="text">Texts</option>
<option value="invisible">Invisible</option>
</select>
</td>
</tr>
</thead>
<tfoot>
<tr>
<td class="align-center" colspan="2"><input type="submit" name="submit" value="Update" /> <input type="reset" value="Reset" /></td>
</tr>
</tfoot>
<tbody id="text" style="display: none;">
<tr>
<td class="title">Text Color:</td>
<td class="field"><input type="text" name="color" size="8" maxlength="7" /></td>
</tr>
</tbody>
<tbody id="image" style="display: none;">
<tr>
<td class="title">Image:</td>
<td class="field"><input type="file" name="image" size="10" /></td>
</tr>
<tr>
<td class="title">X Coordinates:</td>
<td class="field"><input type="text" name="x_coordinates" size="5" /></td>
</tr>
<tr>
<td class="title">Y Coordinates:</td>
<td class="field"><input type="text" name="y_coordinates" size="5" /></td>
</tr>
<tr>
<td class="title">Text Color:</td>
<td class="field"><input type="text" name="color" size="8" maxlength="7" /></td>
</tr>
</tbody>
<tbody>
<tr>
<td class="title">Display:</td>
<td class="field">
<select name="display">
<option value="visitors">Visitors</option>
<option value="hits">Hits</option>
</select>
</td>
</tr>
</tbody>
</table>
</body>
</html>