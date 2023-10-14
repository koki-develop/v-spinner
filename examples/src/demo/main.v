module main

import time
import spinner

fn main() {
	mut spin := spinner.new(spinner.character_sets[0],
		suffix: ' starting up...'
	)

	spin.start()
	time.sleep(2 * time.second)
	spin.suffix = ' processing...'
	time.sleep(2 * time.second)
	spin.suffix = ' shutting down...'
	time.sleep(2 * time.second)
	spin.stop()
}
