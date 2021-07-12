<template>
  <v-app>
    <v-container>
      <v-row>
        <v-col v-for="recipe in recipes" :key="recipe.id">
          <v-sheet>{{ recipe.name }}</v-sheet>
          <v-sheet>{{ recipe.explanation }}</v-sheet>
          <v-sheet>{{ recipe.foodstuff }}</v-sheet>
          <v-sheet>{{ recipe.how }}</v-sheet>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
const axios = require('axios')
let url = 'http://localhost:3000/api/v1/recipes';
export default {
  data: function(){
    return {
      recipes: []
    }
  },
  async asyncData() {
    let recipe = await axios.get(url);
    return { recipes: recipe.data.data }
  }
}
</script>
