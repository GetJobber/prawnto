text "before simple partial"
partial! "test/simple_partial"
text "after simple partial"

text "before local partial"
partial! "test/local_partial", locals: { local: 1 }
text "after local partial"
