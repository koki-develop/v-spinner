module spinner

import time
import os

pub const (
	character_sets = [
		['|', '/', '-', '\\'],
	]
)

[noinit]
pub struct Spinner {
pub mut:
	character_set []string      [required]
	prefix        string
	suffix        string
	duration      time.Duration
	writer_file   os.File
mut:
	index        int
	last_output  string
	stop_channel chan bool
}

[params]
pub struct Config {
	prefix      string
	suffix      string
	duration    ?time.Duration
	writer_file ?os.File
}

pub fn new(character_set []string, config Config) Spinner {
	return Spinner{
		character_set: character_set
		prefix: config.prefix
		suffix: config.suffix
		duration: config.duration or { 100 * time.millisecond }
		writer_file: config.writer_file or { os.stdout() }
	}
}

pub fn (mut s Spinner) start() {
	s.index = 0
	s.stop_channel = chan bool{}

	spawn fn [mut s] () {
		for {
			s.erase() or { panic(err) }
			select {
				_ := <-s.stop_channel {
					s.writer_file.flush()
					break
				}
				else {
					s.print() or { panic(err) }
					s.writer_file.flush()
					time.sleep(s.duration)
				}
			}
		}
	}()
}

pub fn (s Spinner) stop() {
	s.stop_channel <- true
}

fn (mut s Spinner) print() ! {
	character := if s.character_set.len > 0 {
		s.index = (s.index + 1) % s.character_set.len
		s.character_set[s.index]
	} else {
		''
	}

	output := s.prefix + character + s.suffix
	s.writer_file.write_string(output)!
	s.last_output = output
}

fn (mut s Spinner) erase() ! {
	if s.last_output == '' {
		return
	}
	s.writer_file.write_string('\r' + ' '.repeat(s.last_output.len_utf8()) + '\r')!
}
