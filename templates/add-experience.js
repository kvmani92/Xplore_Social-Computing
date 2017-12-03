var _html = "<form id='add-xp'>" +
        "<input id='xp-name' placeholder='Ex. Walk to NQ' />" +
        "<select id='xp-category'>" +
            "<option value='-1' disabled>Please select one</option>" +
            "<option value='Shortcut'>Shortcut</option>" +
            "<option value='Longwalk'>Longwalk</option>" +
            "<option value='Scenic'>Scenic</option>" +
            "<option value='Other'>Other</option>" +
        "</select>" +
        "<button>Add experience</button>" +
    "</form>";

$.template( "add-xp", _html );