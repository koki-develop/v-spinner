module main

import time
import spinner

fn main() {
	mut spin := spinner.new(spinner.slash_1)

	spin.start() // Display the spinner
	time.sleep(3 * time.second)
	spin.stop()
}
