<template>
  <v-app>
    <v-card>
      <v-card-text>{{ recipe.name }}</v-card-text>
      <v-btn @click="toTop()">Topへ</v-btn>
    </v-card>
  </v-app>
</template>

<script>
export default {
  data: () => {
    return {
      recipe: {},
    }
  },
  mounted() {
    this.fetchContext()
  },
  methods:{
    toTop() {
      this.$router.push('/recipes')
    },
    fetchContext() {
      const url = `api/v1/recipes/${this.$route.params.id}`
      this.$axios.get(url)
        .then(res => this.recipe = res.data.data)
        .catch(error => console.log(error));
    }
  }
}
</script>