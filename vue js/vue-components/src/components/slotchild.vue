<template>
    <div class="child-component">
      <header>
        <slot name="header">
          <!-- Default header content -->
          <h2>Default Header</h2>
        </slot>
      </header>
      <main>
        <slot name="content">
          <!-- Default content -->
          <p>Default Content</p>
        </slot>
      </main>
      <footer>
        <slot name="footer">
          <!-- Default footer content -->
          <h2>Default Footer</h2>
        </slot>
      </footer>
    </div>
  </template>
  
  <script>
  export default {
    // Any additional logic for the child component can be added here
  };
  </script>
  
  <style scoped>
  /* Styles for child component */
  .child-component {
    border: 1px solid #ccc;
    padding: 20px;
    margin: 20px 0;
  }
  </style>
  