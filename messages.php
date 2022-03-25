<?php
include_once "classes/Page.php";
include_once "classes/Db.php";
Page::display_header("Messages");
$db = new Db("localhost", "localuser", "pwd", "bezp_lab3");
// adding new message
if (isset($_REQUEST['add_message'])) {
$name = $_REQUEST['name'];
$type = $_REQUEST['type'];
$id = $_REQUEST['id'];
// var_dump($_REQUEST); die;
$content = $_REQUEST['content'];
if (empty($id)) {
    if (!$db->addMessage($name,$type,$content))
    echo "Adding new message failed";
}
else {
    if (!$db->editMessage($id, $name,$type,$content))
    echo "Editing message failed";
}
}
?>
<!--------------------------------------------------------------------->
<hr>
<P> Messages</P>
<ol>
<?php
$sql = "SELECT * from message";
$messages = $db->select($sql);
foreach ($messages as $msg)://returned as objects
echo "<li>";
echo '<b>'.$msg->name.': </b>'.$msg->message ;
echo "</li>";
endforeach;
?>
</ol>
<!--------------------------------------------------------------------->
<hr>
<P>Navigation</P>
<?php
Page::display_navigation();
?>
</body>
</html>