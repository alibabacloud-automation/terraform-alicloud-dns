// +build kubeall kubernetes

// NOTE: we have build tags to differentiate kubernetes tests from non-kubernetes tests. This is done because minikube
// is heavy and can interfere with docker related tests in terratest. Specifically, many of the tests start to fail with
// `connection refused` errors from `minikube`. To avoid overloading the system, we run the kubernetes tests and helm
// tests separately from the others. This may not be necessary if you have a sufficiently powerful machine.  We
// recommend at least 4 cores and 16GB of RAM if you want to run all the tests together.

package k8s

import (
	"fmt"
	"strings"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

	"github.com/gruntwork-io/terratest/modules/random"
)

func TestListPodsReturnsPodsInNamespace(t *testing.T) {
	t.Parallel()

	uniqueID := strings.ToLower(random.UniqueId())
	options := NewKubectlOptions("", "")
	options.Namespace = uniqueID
	configData := fmt.Sprintf(EXAMPLE_POD_YAML_TEMPLATE, uniqueID, uniqueID)
	defer KubectlDeleteFromString(t, options, configData)
	KubectlApplyFromString(t, options, configData)

	pods := ListPods(t, options, metav1.ListOptions{})
	require.Equal(t, len(pods), 1)
	pod := pods[0]
	require.Equal(t, pod.Name, "nginx-pod")
	require.Equal(t, pod.Namespace, uniqueID)
}

func TestGetPodEReturnsErrorForNonExistantPod(t *testing.T) {
	t.Parallel()

	options := NewKubectlOptions("", "")
	_, err := GetPodE(t, options, "nginx-pod")
	require.Error(t, err)
}

func TestGetPodEReturnsCorrectPodInCorrectNamespace(t *testing.T) {
	t.Parallel()

	uniqueID := strings.ToLower(random.UniqueId())
	options := NewKubectlOptions("", "")
	options.Namespace = uniqueID
	configData := fmt.Sprintf(EXAMPLE_POD_YAML_TEMPLATE, uniqueID, uniqueID)
	defer KubectlDeleteFromString(t, options, configData)
	KubectlApplyFromString(t, options, configData)

	pod := GetPod(t, options, "nginx-pod")
	require.Equal(t, pod.Name, "nginx-pod")
	require.Equal(t, pod.Namespace, uniqueID)
}

func TestWaitUntilNumPodsCreatedReturnsSuccessfully(t *testing.T) {
	t.Parallel()

	uniqueID := strings.ToLower(random.UniqueId())
	options := NewKubectlOptions("", "")
	options.Namespace = uniqueID
	configData := fmt.Sprintf(EXAMPLE_POD_YAML_TEMPLATE, uniqueID, uniqueID)
	defer KubectlDeleteFromString(t, options, configData)
	KubectlApplyFromString(t, options, configData)

	WaitUntilNumPodsCreated(t, options, metav1.ListOptions{}, 1, 60, 1*time.Second)
}

func TestWaitUntilPodAvailableReturnsSuccessfully(t *testing.T) {
	t.Parallel()

	uniqueID := strings.ToLower(random.UniqueId())
	options := NewKubectlOptions("", "")
	options.Namespace = uniqueID
	configData := fmt.Sprintf(EXAMPLE_POD_YAML_TEMPLATE, uniqueID, uniqueID)
	defer KubectlDeleteFromString(t, options, configData)
	KubectlApplyFromString(t, options, configData)

	WaitUntilPodAvailable(t, options, "nginx-pod", 60, 1*time.Second)
}

const EXAMPLE_POD_YAML_TEMPLATE = `---
apiVersion: v1
kind: Namespace
metadata:
  name: %s
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  namespace: %s
spec:
  containers:
  - name: nginx
    image: nginx:1.15.7
    ports:
    - containerPort: 80
`
