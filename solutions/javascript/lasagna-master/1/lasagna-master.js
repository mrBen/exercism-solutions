/// <reference path="./global.d.ts" />
// @ts-check

/**
 * @param {number | undefined} remainingTime
 * @returns {string}
 */
export function cookingStatus(remainingTime = undefined) {
  if (remainingTime === undefined)
    return 'You forgot to set the timer.';

  if (remainingTime === 0)
    return 'Lasagna is done.';

  return 'Not done, please wait.';
}

/**
 * @param {string[]} layers
 * @param {number} preparationTimePerLayer
 * @returns {number}
 */
export function preparationTime(layers, preparationTimePerLayer = 2) {
  return layers.length * preparationTimePerLayer;
}

/**
 * @param {string[]} layers
 * @returns {Record<string, number>}
 */
export function quantities(layers) {
  let noodles = 0;
  let sauce = 0;
  for (let i = 0; i < layers.length; i++) {
    if (layers[i] === 'noodles')
      noodles += 50;
    if (layers[i] === 'sauce')
      sauce += 0.2;
  }
  return { noodles, sauce };
}

/**
 * @param {string[]} friendsList
 * @param {string[]} myList
 */
export function addSecretIngredient(friendsList, myList) {
  const secretIngredient = friendsList[friendsList.length - 1];
  myList.push(secretIngredient);
}

/**
 * @param {Record<string, number>} recipe
 * @param {number} numPortions
 * @returns {Record<string, number>}
 */
export function scaleRecipe(recipe, numPortions) {
  let scaled = {};
  for (let ingredient in recipe) {
    scaled[ingredient] = (recipe[ingredient] / 2) * numPortions;
  }
  return scaled;
}
