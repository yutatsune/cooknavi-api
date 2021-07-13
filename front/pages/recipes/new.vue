<template>
  <v-app>
    <v-card class="container">
      <v-btn @click="toTop()">Topへ</v-btn>
      <v-card-title>レシピの投稿</v-card-title>
      <v-card-text>
        <v-card-subtitle>レシピ名</v-card-subtitle>
        <v-text-field
          type="text"
          v-model="name"
        ></v-text-field>
        <v-card-subtitle>このレシピについて</v-card-subtitle>
        <v-textarea
          type="text"
          v-model="explanation"
        >
        </v-textarea>
        <v-card-subtitle>材料</v-card-subtitle>
        <v-textarea
          type="text"
          v-model="foodstuff"
        >
        </v-textarea>
        <v-card-actions>
          <v-btn>材料を追加する</v-btn>
        </v-card-actions>
        <v-card-subtitle>作り方</v-card-subtitle>
        <v-textarea
          type="text"
          v-model="how"
        >
        </v-textarea>
        <v-card-actions>
          <v-btn>作り方を追加する</v-btn>
        </v-card-actions>
      </v-card-text>
      <v-card-actions>
        <v-btn @click="postRecipe">レシピを投稿する</v-btn>
      </v-card-actions>
    </v-card>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    name: null,
    explanation: null,
    foodstuff: null,
    how: null,
  }),
  methods: {
    toTop() {
      this.$router.push('/recipes')
    },
    postRecipe() {
      const url = 'api/v1/recipes';
      const recipe = {
        name: this.name,
        explanation: this.explanation,
        foodstuff: this.foodstuff,
        how: this.how,
      };
      this.$axios.post(url, { recipe })
        .then(res => console.log(res.status))
        .catch(error => console.log(error));
    },
  }
}
</script>