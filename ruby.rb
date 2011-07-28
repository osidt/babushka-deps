dep 'ruby 1.8.7' do
	met? { !raw_shell('rvm list rubies | grep 1.8.7').stdout.empty? }
	meet { shell 'rvm install 1.8.7' }
end