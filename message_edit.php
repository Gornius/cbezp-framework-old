<?php
include_once "classes/Page.php";
include_once "classes/Db.php";

$message_id = $_GET['id'];
$db = new Db("localhost", "localuser", "pwd", "bezp_lab3");
$sql = "SELECT * FROM message WHERE id=$message_id LIMIT 1";
$message = $db->select($sql)[0];

// var_dump($message); die;

Page::display_header("Edit message");
    ?>
    <hr>
    <P>Edit message</P>
    <form method="post" action="messages.php">
    <input type="hidden" name="id" id="id" value="<?php echo $_GET['id'] ?>" />
    <table>
    <tr>
    <td>Name</td>
    <td>
    <label for="name"></label>
    <input required type="text" name="name" id="name" size="56" value="<?php echo $message->name ?>"/>
    </td>
    </tr>
    <tr>
    <td>Type</td>
    <td>
    <label for="type"></label>
    <select name="type" id="type">
    <option value="public">Public</option>
    <option value="private" <?php if ($message->type == 'private') echo "selected"; ?>>Private</option>
    </select>
    </td>
    </tr>
    <tr>
    <td>Message content</td>
    <td>
    <label for="content"></label>
    <textarea required type="text" name="content" id="content" rows="10" cols="40">
        <?php echo $message->message; ?>
    </textarea>
    </td>
    </tr>
    </table>
    <input type="submit" id= "submit" value="Edit message" name="add_message">
    </form>
    <hr>
    <P>Navigation</P>
    <?php
    Page::display_navigation();
?>
</body>
</html>