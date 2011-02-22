define :inner do
  execute 'inner test' do
    command "[[ ! -s #{params[:foo]} ]]"
  end
end
