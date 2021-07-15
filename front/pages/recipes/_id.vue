<template>
  <v-app>
    <v-card>
      <v-btn @click="toTop()">Topへ</v-btn>
      <v-dialog v-model="dialog">
        <!-- アクティベータースロット -->
        <template v-slot:activator="{ on }">
          <v-btn v-on="on">
            編集
          </v-btn>
        </template>
        <!-- ダイアログコンテンツ -->
        <v-card>
          <v-card-title>レシピの編集</v-card-title>
          <v-card-text>
            <v-card-subtitle>レシピ名</v-card-subtitle>
            <v-text-field
              type="text"
              v-model="recipe.name"
            ></v-text-field>
            <v-card-subtitle>このレシピについて</v-card-subtitle>
            <v-textarea
              type="text"
              v-model="recipe.explanation"
            >
            </v-textarea>
            <v-card-subtitle>材料</v-card-subtitle>
            <v-textarea
              type="text"
              v-model="recipe.foodstuff"
            >
            </v-textarea>
            <v-card-actions>
              <v-btn>材料を追加する</v-btn>
            </v-card-actions>
            <v-card-subtitle>作り方</v-card-subtitle>
            <v-textarea
              type="text"
              v-model="recipe.how"
            >
            </v-textarea>
            <v-card-actions>
              <v-btn>作り方を追加する</v-btn>
            </v-card-actions>
          </v-card-text>
          <v-card-actions>
            <v-btn @click="update()">
              更新する
            </v-btn>
          </v-card-actions>
          <v-card-actions>
            <v-btn @click="dialog = false">
              キャンセル
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      <v-card-text>{{ recipe.name }}</v-card-text>
      <v-card-text>{{ recipe.explanation }}</v-card-text>
      <v-card-text>{{ recipe.foodstuff }}</v-card-text>
      <v-card-text>{{ recipe.how }}</v-card-text>
    </v-card>
  </v-app>
</template>

<script>
export default {
  data: () => {
    return {
      dialog: false,
      recipe: "",
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
    },
    update() {
      const url = `api/v1/recipes/${this.$route.params.id}`
      const recipe = {
        name: this.name,
        explanation: this.explanation,
        foodstuff: this.foodstuff,
        how: this.how,
      };
      this.$axios.put(url, {recipe})
        .then(res => console.log(res.status))
        .catch(error => console.log(error));
    }
  }
}
</script>