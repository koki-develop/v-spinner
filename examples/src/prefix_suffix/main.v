module main

import time
import spinner

fn main() {
	mut spin := spinner.new(spinner.slash_1,
		prefix: '[PREFIX] ' // optional
		suffix: ' starting up...' // optional
	)

	spin.start() // Display the spinner
	time.sleep(2 * time.second)

	// It's also possible to change in the middle
	spin.suffix = ' shutting down...'

	time.sleep(2 * time.second)
	spin.stop()
}
