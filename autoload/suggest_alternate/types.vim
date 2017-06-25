function suggest_alternate#types#Ruby()
  if s:Exists('app')
    let b:suggest_alternate_source_dir = 'app/'
    let b:suggest_alternate_source_dir_pattern = '^\(app\|lib\)/'
  elseif s:Exists('lib')
    let b:suggest_alternate_source_dir = "lib/"
  else
    let b:suggest_alternate_source_dir = "./"
    let b:suggest_alternate_source_dir_pattern = '^'
  endif

  if s:Exists('spec')
    let b:suggest_alternate_test_dir  = "spec/"
    let b:suggest_alternate_test_token = "_spec"
  else
    let b:suggest_alternate_test_dir  = "test/"
    let b:suggest_alternate_test_token = "_test"
  endif
  let b:suggest_alternate_test_token_location = "$"
  let b:suggest_alternate_enabled = 1
endfunction

function s:Exists(path)
  return finddir(a:path, '.;') == a:path
endfunction

