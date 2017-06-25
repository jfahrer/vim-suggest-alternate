function! suggest_alternate#FileName()
  if exists('b:alternate_enabled')
    return s:GenerateSuggestions()
  else
    echom "Alternate suggestion not enabled for this file type."
  endif
endfunction

function s:GenerateSuggestions()
  let relpath        = substitute(expand('%:p:h'), getcwd() . "/" , "", "") . '/'
  let file_name      = expand('%:t:r:r')
  let file_extension = expand('%:e:e')
  if s:IsTest(file_name)
    return s:SuggestSourceFile(relpath, file_name, file_extension)
  else
    return s:SuggestTestFile(relpath, file_name, file_extension)
  endif
endfunction

function s:IsTest(file_name)
  return match(a:file_name, s:TestTokenPattern()) != -1
endfunction

function s:TestTokenPattern()
  return substitute(b:alternate_test_token, b:alternate_test_token_location, b:alternate_test_token_location, '')
endfunction

function s:SuggestTestFile(relpath, source_file_name, file_extension)
  let source_dir_pattern = b:suggest_alternate_source_dir
  if exists('b:suggest_alternate_source_dir_pattern')
    let source_dir_pattern = b:suggest_alternate_source_dir_pattern
  endif
  let test_file_name = substitute(a:source_file_name, b:alternate_test_token_location, b:alternate_test_token, '')
  let test_dir_name = substitute(a:relpath, source_dir_pattern, b:suggest_alternate_test_dir, '')
  let file =  test_dir_name . test_file_name . '.' . a:file_extension
  return file
endfunction

function s:SuggestSourceFile(relpath, test_file_name, file_extension)
  let source_file_name = substitute(a:test_file_name, s:TestTokenPattern(), '', '')
  let source_dir_name = substitute(a:relpath, b:suggest_alternate_test_dir, b:suggest_alternate_source_dir, '')
  let file =  source_dir_name . source_file_name . '.' . a:file_extension
  return file
endfunction
