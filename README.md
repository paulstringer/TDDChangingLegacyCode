#An example project 'InMemoryDirectory' for exploring changing legacy code, based on Michael C. Feathers code example.

1. Find Change Points e.g. ```generateIndex() addElement()```
2. Find Test Points e.g. ```element(), element.name(), elementCount()```
3. Write charactizeration tests that guard existing behaviour
4. Write a failing test that shows the bug in ```generateIndex()``
5. Pass the test
6. Write failing tests for new behaviour 'Allow clients to add elements and the index to be updated auto-magically'
7. Pass the tests
8. Remove repetition