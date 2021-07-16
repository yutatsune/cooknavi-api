<template>
  <v-app>
    <v-container>
      <v-row>
        <v-col v-for="recipe in recipes" :key="recipe.id">
          <v-card @click="toShow(recipe.id)">
            <v-sheet>{{ recipe.name }}</v-sheet>
            <v-sheet>{{ recipe.explanation }}</v-sheet>
            <v-sheet>{{ recipe.foodstuff }}</v-sheet>
            <v-sheet>{{ recipe.how }}</v-sheet>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-btn @click="toNew()">新規投稿</v-btn>
  </v-app>
</template>

<script>
const axios = require('axios')
let url = 'http://localhost:3000/api/v1/recipes';
export default {
  data: () => {
    return {
      recipes: []
    }
  },
  mounted() {
    this.fetchContents()
  },
  methods:{
    toNew() {
      this.$router.push(`/recipes/new`)
    },
    toShow(id) {
      this.$router.push(`/recipes/${id}`)
    },
    fetchContents() {
      const url = "/api/v1/recipes"
      this.$axios.get(url)
        .then(res =>{
          this.recipes = res.data.data
        })
        .catch(() => {})
    }
  },
}
</script>
