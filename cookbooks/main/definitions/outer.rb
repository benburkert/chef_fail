define :outer do
  _foo = params[:foo] || raise("foo is nil")

  execute 'outer test' do
    command "[[ ! -s #{params[:foo]} ]]" # params is in scope, parasm[:foo] has a value
  end

  inner 'explicit' do
    foo _foo # _foo is in scope, so it has a value
  end

  inner 'implicit' do
    foo params[:foo] # params is from a different scope, so params[:foo] has no value
  end
end
