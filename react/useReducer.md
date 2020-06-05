# `useReducer`

-   `const [state, dispatch] = useReducer(reducer, initialArg, init);`
-   A lot like `useState` in that it can store/manipulate state values, but particularly useful when you have complex state logic that involves multiple sub-values or when the next state depends on the previous one.
-   Can avoid redux when combined with `useContext`.
-   Pass `dispatch` down instead of callbacks, which can help in performance optimization.
-   React guarantees that the `dispatch` function identity is stable and won't change on re-renders. It's safe to omit it from the `useEffect` or `useCallback` dependency list.
-   If you return the same value from a Reducer Hook as the current state, React will bail out without rendering the children or firing effects.

## Passing `dispatch`

Instead of drilling a callback down a component tree as a prop, pass `dispatch` via context.

````js
const TodosDispatch = React.createContext(null);

function TodosApp() {
  // Note: `dispatch` won't change between re-renders
  const [todos, dispatch] = useReducer(todosReducer);

  return (
    <TodosDispatch.Provider value={dispatch}>
      <DeepTree todos={todos} />
    </TodosDispatch.Provider>
  );
}

//...

function DeepChild(props) {
  // If we want to perform an action, we can get dispatch from context.
  const dispatch = useContext(TodosDispatch);

  function handleClick() {
    dispatch({ type: 'add', text: 'hello' });
  }

  return (
    <button onClick={handleClick}>Add todo</button>
  );
}```
````
