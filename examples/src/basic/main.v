module main

import time
import spinner

fn main() {
	mut spin := spinner.new(spinner.character_sets[0])

	spin.start() // Display the spinner
	time.sleep(3 * time.second)
	spin.stop()
}
