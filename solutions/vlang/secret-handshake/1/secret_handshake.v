module main

enum Command as u8 {
	wink
	double_blink
	close_your_eyes
	jump
}

pub fn commands(encoded_message int) []Command {
    mut commands := []Command{}
    if encoded_message & 0b00001 > 0 {
        commands << Command.wink
    }
    if encoded_message & 0b00010 > 0 {
        commands << Command.double_blink
    }
    if encoded_message & 0b00100 > 0 {
        commands << Command.close_your_eyes
    }
    if encoded_message & 0b01000 > 0 {
        commands << Command.jump
    }
    if encoded_message & 0b10000 > 0 {
        commands.reverse_in_place()
    }
	return commands
}
