module main

import time
import spinner

fn main() {
	mut spin := spinner.new(spinner.slash_1,
		duration: 500 * time.millisecond
	)

	spin.start() // Display the spinner
	time.sleep(2 * time.second)

	// It's also possible to change in the middle
	spin.duration = 50 * time.millisecond

	time.sleep(2 * time.second)
	spin.stop()
}
