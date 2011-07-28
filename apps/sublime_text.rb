dep 'sublime text installed' do
	met? {
		cd('/apps') { |path|
			(path / 'sublime_text').exists?
		}
	}
	meet {
		cd('/apps') { |path|
			shell 'wget -O sublime_text.tar.bz2 http://www.sublimetext.com/Sublime%20Text%202%20Build%202076.tar.bz2'
			shell 'tar -jxvf sublime_text.tar.bz2'
			shell 'mv Sublime\ Text\ 2/ sublime_text'
			shell 'rm sublime_text.tar.bz2'
		}
	}
end

dep 'sublime text in path' do
	met? { which 'sublime_text' }
	meet {
		cd('/usr/local/bin') {|path|
	      shell "ln -s /apps/sublime_text/sublime_text .", :sudo => !path.writable?
	    }
	}
end

dep 'sublime text' do
	requires 'sublime text installed', 'sublime text in path'
end